/*! \file    DenseMat.cpp
 *  \brief   Dense matrix-vector operations
 *  \author  Shizhe Li
 *  \date    Oct/21/2021
 *
 *-----------------------------------------------------------------------------------
 *  Copyright (C) 2021--present by the OpenCAEPoroX team. All rights reserved.
 *  Released under the terms of the GNU Lesser General Public License 3.0 or later.
 *-----------------------------------------------------------------------------------
 */

#include "DenseMat.hpp"

int dgemm_(const char*   transa,
           const char*   transb,
           const int*    m,
           const int*    n,
           const int*    k,
           const double* alpha,
           const double* A,
           const int*    lda,
           const double* B,
           const int*    ldb,
           const double* beta,
           double*       C,
           const int*    ldc){
            mydgemm_cpu_v4(*m,*n,*k,*alpha,A,*lda,B,*ldb,*beta,C,*ldc);
           }


// WARNING: absolute sum!
OCP_DBL Dnorm1(const INT& N, OCP_DBL* x)
{
#if OCPFLOATTYPEWIDTH == 64   
    const INT incx = 1;
    return dasum_(&N, x, &incx);
#else
    return OCP_norm1(N, x);
#endif
}

OCP_DBL Dnorm2(const INT& N, OCP_DBL* x)
{
#if OCPFLOATTYPEWIDTH == 64
    const INT incx = 1;
    return dnrm2_(&N, x, &incx);
#else
    return OCP_norm2(N, x);
#endif
}

void Dscalar(const INT& n, const OCP_DBL& alpha, OCP_DBL* x)
{

#if OCPFLOATTYPEWIDTH == 64
    // x = a x
    const int incx = 1;
    dscal_(&n, &alpha, x, &incx);
#else
    OCP_scale(n, alpha, x);
#endif

}

void Daxpy(const INT& n, const OCP_DBL& alpha, const OCP_DBL* x, OCP_DBL* y)
{

#if OCPFLOATTYPEWIDTH == 64
    // y= ax +y
    const int incx = 1, incy = 1;
    daxpy_(&n, &alpha, x, &incx, y, &incy);
#else
    OCP_axpy(n, alpha, x, y);
#endif
}

void DaABpbC(const INT&    m,
             const INT&    n,
             const INT&    k,
             const OCP_DBL& alpha,
             const OCP_DBL* A,
             const OCP_DBL* B,
             const OCP_DBL& beta,
             OCP_DBL*       C)
{
    /*  C' = alpha B'A' + beta C'
     *  A: m x k
     *  B: k x n
     *  C: m x n
     *  all column majored matrices, no tranpose
     *  A' in col-order in Fortran = A in row-order in C/Cpp
     */

#if OCPFLOATTYPEWIDTH == 64
    const char transa = 'N', transb = 'N';
    dgemm_(&transa, &transb, &n, &m, &k, &alpha, B, &n, A, &k, &beta, C, &n);

#else
    OCP_ABpC(m, n, k, A, B, C);
#endif
}


void LUSolve(const INT& nrhs, const INT& N, OCP_DBL* A, OCP_DBL* b, INT* pivot)
{

#if OCPFLOATTYPEWIDTH == 64
    INT info;
    dgesv_(&N, &nrhs, A, &N, pivot, b, &N, &info);

    if (info < 0) {
        cout << "Wrong Input !" << endl;
    } else if (info > 0) {
        cout << "Singular Matrix !" << endl;
    }

#else
    OCP_ABORT("NOT AVAILABLE!");

#endif
}

INT SYSSolve(const INT& nrhs, const OCP_CHAR* uplo, const INT& N, OCP_DBL* A, OCP_DBL* b, INT* pivot, OCP_DBL* work, const INT& lwork)
{

#if OCPFLOATTYPEWIDTH == 64
    INT info;
    dsysv_(uplo, &N, &nrhs, A, &N, pivot, b, &N, work, &lwork, &info);
    if (info < 0) {
        cout << "Wrong Input !" << endl;
    } else if (info > 0) {
        cout << "Singular Matrix !" << endl;
    }
    return info;
#else
    OCP_ABORT("NOT AVAILABLE!");

#endif
}


void CalEigenSY(const INT& N, OCP_SIN* A, OCP_SIN* w, OCP_SIN* work, const INT& lwork)
{

#if OCPFLOATTYPEWIDTH == 64
    INT  info;
    INT  iwork[1] = { 0 };
    INT  liwork = 1;
    char uplo{ 'U' };
    char Nonly{ 'N' };

    ssyevd_(&Nonly, &uplo, &N, A, &N, w, work, &lwork, iwork, &liwork, &info);
    if (info > 0) {
        cout << "failed to compute eigenvalues!" << endl;
    }

#else
    OCP_ABORT("NOT AVAILABLE!");

#endif
}



void myDABpCp(const int& m,
    const int& n,
    const int& k,
    const double* A,
    const double* B,
    double* C,
    const int* flag,
    const int     N)
{
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < k; j++) {
            for (int p = 0; p < 3; p++) {
                if (flag[p] != 0) C[i * k + j] += A[i * n + p] * B[p * k + j];
            }
            for (int p = 0; p < 2; p++) {
                if (flag[p] != 0) {
                    for (int m = 0; m < N; m++) {
                        C[i * k + j] += A[i * n + 3 + p * (N + 1) + m] *
                            B[(3 + p * (N + 1) + m) * k + j];
                    }
                }
            }
        }
    }
}


void myDABpCp1(const int& m,
    const int& n,
    const int& k,
    const double* A,
    const double* B,
    double* C,
    const int* flag,
    const int     N)
{

    for (int i = 0; i < m; i++) {
        for (int j = 0; j < k; j++) {
            int s = 0;
            for (int p = 0; p < 3; p++) {
                if (flag[p] != 0) {
                    C[i * k + j] += A[i * n + p] * B[s * k + j];
                    s++;
                }
            }
            for (int p = 0; p < 2; p++) {
                if (flag[p] != 0) {
                    for (int m = 0; m < N; m++) {
                        C[i * k + j] += A[i * n + 3 + p * (N + 1) + m] * B[s * k + j];
                        s++;
                    }
                }
            }
        }
    }
}

void myDABpCp2(const int& m,
    const int& n,
    const int& k,
    const double* A,
    const double* B,
    double* C,
    const int* flag,
    const int     N)
{
    for (int i = 0; i < m; i++) {
        for (int j = 0; j < k; j++) {
            int s = 0;
            for (int p = 0; p < 3; p++) {
                if (flag[p] != 0) {
                    C[i * k + j] += A[i * n + s] * B[p * k + j];
                    s++;
                }
            }
            for (int p = 0; p < 2; p++) {
                if (flag[p] != 0) {
                    for (int m = 0; m < N; m++) {
                        C[i * k + j] += A[i * n + s] * B[(3 + p * (N + 1) + m) * k + j];
                        s++;
                    }
                }
            }
        }
    }
}

void scale_c_k4(double *C, int M, int N, int LDC, double scalar)
{
    int i,j;
    for (i=0;i<M;i++){
        for (j=0;j<N;j++){
            C(i,j)*=scalar;
        }
    }
}

void mydgemm_cpu_opt_k4(int M, int N, int K, double alpha, const double *A, int LDA, const double *B, int LDB, double beta, double *C, int LDC)
{
    int i,j,k;
    if (beta != 1.0) scale_c_k4(C,M,N,LDC,beta);
    for (i=0;i<M;i++){
        for (j=0;j<N;j++){
            double tmp=C(i,j);
            for (k=0;k<K;k++){
                tmp += alpha*A(i,k)*B(k,j);
            }
            C(i,j) = tmp;
        }
    }
}

void mydgemm_cpu_v4(int M, int N, int K, double alpha, const double *A, int LDA, const double *B, int LDB, double beta, double *C, int LDC)
{
    int i,j,k;
    // static int tickforexp=100000;
    // const int maxt = 100000;
    // if(tickforexp >= maxt){
    //     std::cout << "M: " << M << ",N: " << N << ",K: " << K << std::endl;
    //     tickforexp = 0;
    // } else {
    //     tickforexp++;
    // }
    if (beta != 1.0) scale_c_k4(C,M,N,LDC,beta);
    int M4=M&-4,N4=N&-4;
    for (i=0;i<M4;i+=4){
        for (j=0;j<N4;j+=4){
            double c00=C(i,j);
            double c01=C(i,j+1);
            double c02=C(i,j+2);
            double c03=C(i,j+3);
            double c10=C(i+1,j);
            double c11=C(i+1,j+1);
            double c12=C(i+1,j+2);
            double c13=C(i+1,j+3);
            double c20=C(i+2,j);
            double c21=C(i+2,j+1);
            double c22=C(i+2,j+2);
            double c23=C(i+2,j+3);
            double c30=C(i+3,j);
            double c31=C(i+3,j+1);
            double c32=C(i+3,j+2);
            double c33=C(i+3,j+3);
            for (k=0;k<K;k++){
                double a0 = alpha*A(i,k);
                double a1 = alpha*A(i+1,k);
                double a2 = alpha*A(i+2,k);
                double a3 = alpha*A(i+3,k);
                double b0 = B(k,j);
                double b1 = B(k,j+1);
                double b2 = B(k,j+2);
                double b3 = B(k,j+3);
                c00 += a0*b0;
                c01 += a0*b1;
                c02 += a0*b2;
                c03 += a0*b3;
                c10 += a1*b0;
                c11 += a1*b1;
                c12 += a1*b2;
                c13 += a1*b3;
                c20 += a2*b0;
                c21 += a2*b1;
                c22 += a2*b2;
                c23 += a2*b3;
                c30 += a3*b0;
                c31 += a3*b1;
                c32 += a3*b2;
                c33 += a3*b3;
            }
            C(i,j) = c00;
            C(i,j+1) = c01;
            C(i,j+2) = c02;
            C(i,j+3) = c03;
            C(i+1,j) = c10;
            C(i+1,j+1) = c11;
            C(i+1,j+2) = c12;
            C(i+1,j+3) = c13;
            C(i+2,j) = c20;
            C(i+2,j+1) = c21;
            C(i+2,j+2) = c22;
            C(i+2,j+3) = c23;
            C(i+3,j) = c30;
            C(i+3,j+1) = c31;
            C(i+3,j+2) = c32;
            C(i+3,j+3) = c33;
        }
    }
    if (M4==M&&N4==N) return;
    // boundary conditions
    if (M4!=M) mydgemm_cpu_opt_k4(M-M4,N,K,alpha,A+M4,LDA,B,LDB,1.0,&C(M4,0),LDC);
    if (N4!=N) mydgemm_cpu_opt_k4(M4,N-N4,K,alpha,A,LDA,&B(0,N4),LDB,1.0,&C(0,N4),LDC);
}


/*----------------------------------------------------------------------------*/
/*  Brief Change History of This File                                         */
/*----------------------------------------------------------------------------*/
/*  Author              Date             Actions                              */
/*----------------------------------------------------------------------------*/
/*  Shizhe Li           Oct/21/2021      Create file                          */
/*----------------------------------------------------------------------------*/
