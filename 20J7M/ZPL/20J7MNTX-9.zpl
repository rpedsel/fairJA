set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.824, <2> 28.4914, <3> 18.0038, <4> 35.7298, <5> 27.2766, <6> 22.505, <7> 25.1692, <8> 21.9881, <9> 24.267, <10> 25.2184, <11> 27.844, <12> 17.2682, <13> 34.1189, <14> 28.3416, <15> 18.3178, <16> 26.4775, <17> 27.281, <18> 31.6358, <19> 27.0835, <20> 15.3524;
param workload[JOB] := <1> 4.9824, <2> 5.3377, <3> 4.2431, <4> 5.9774, <5> 5.2227, <6> 4.7439, <7> 5.0169, <8> 4.6891, <9> 4.9262, <10> 5.0218, <11> 5.2767, <12> 4.1555, <13> 5.8411, <14> 5.3237, <15> 4.2799, <16> 5.1456, <17> 5.2231, <18> 5.6246, <19> 5.2042, <20> 3.9182;
param capacity[MACHINE] := <1> 10.7308, <2> 10.7308, <3> 10.7308, <4> 10.7308, <5> 10.7308, <6> 10.7308, <7> 10.7308;

var x[JM];
var z;
maximize minBenefit: z;
subto Z:
   forall <m> in MACHINE do
      sum <j> in JOB : benefit[j] * x[j,m] >= z;
subto K:
   forall <m> in MACHINE do
      sum <j> in JOB : workload[j] * x[j,m] <= capacity[m];
subto X:
   forall <j> in JOB do
      sum <m> in MACHINE : x[j,m] <= 1;
subto A:
   forall <j,m> in JM do
      x[j,m] >= 0;
