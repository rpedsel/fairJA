set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.6356, <2> 48.4199, <3> 16.0951, <4> 20.7653, <5> 32.9912, <6> 39.3546, <7> 30.742, <8> 39.4992, <9> 39.5227, <10> 19.5767, <11> 35.2795, <12> 7.979, <13> 6.8007, <14> 37.2105, <15> 48.4571, <16> 32.3138, <17> 31.3308, <18> 45.9219, <19> 26.2042, <20> 49.339;
param workload[JOB] := <1> 1269.896, <2> 2344.4867, <3> 259.0522, <4> 431.1977, <5> 1088.4193, <6> 1548.7845, <7> 945.0706, <8> 1560.1868, <9> 1562.0438, <10> 383.2472, <11> 1244.6431, <12> 63.6644, <13> 46.2495, <14> 1384.6213, <15> 2348.0905, <16> 1044.1817, <17> 981.619, <18> 2108.8209, <19> 686.6601, <20> 2434.3369;
param capacity[MACHINE] := <1> 2543.0649, <2> 2543.0649, <3> 2543.0649, <4> 2543.0649, <5> 2543.0649, <6> 2543.0649, <7> 2543.0649;

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