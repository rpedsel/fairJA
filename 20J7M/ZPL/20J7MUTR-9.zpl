set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.7816, <2> 29.6786, <3> 40.641, <4> 18.3649, <5> 20.8923, <6> 20.6229, <7> 30.4721, <8> 7.6975, <9> 6.5318, <10> 30.5045, <11> 42.7064, <12> 27.8454, <13> 12.1749, <14> 18.6923, <15> 34.7385, <16> 10.0981, <17> 18.8317, <18> 44.9717, <19> 2.33, <20> 42.8518;
param workload[JOB] := <1> 16.1726, <2> 46.3481, <3> 46.001, <4> 32.7602, <5> 19.8095, <6> 6.7451, <7> 8.7304, <8> 22.5456, <9> 38.7584, <10> 44.9019, <11> 16.2814, <12> 3.033, <13> 8.9467, <14> 15.2855, <15> 3.2466, <16> 26.6133, <17> 25.659, <18> 44.8222, <19> 9.5135, <20> 30.2531;
param capacity[MACHINE] := <1> 49.9743, <2> 49.9743, <3> 49.9743, <4> 49.9743, <5> 49.9743, <6> 49.9743, <7> 49.9743;

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
