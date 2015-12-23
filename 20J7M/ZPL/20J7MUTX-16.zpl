set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 40.0209, <2> 20.311, <3> 39.0447, <4> 13.4294, <5> 27.5747, <6> 23.7888, <7> 8.2066, <8> 48.054, <9> 5.0198, <10> 30.2469, <11> 18.4917, <12> 32.5013, <13> 14.0231, <14> 46.3211, <15> 46.8095, <16> 44.3121, <17> 30.1058, <18> 10.3787, <19> 30.2029, <20> 16.2975;
param workload[JOB] := <1> 6.3262, <2> 4.5068, <3> 6.2486, <4> 3.6646, <5> 5.2512, <6> 4.8774, <7> 2.8647, <8> 6.9321, <9> 2.2405, <10> 5.4997, <11> 4.3002, <12> 5.701, <13> 3.7447, <14> 6.806, <15> 6.8417, <16> 6.6567, <17> 5.4869, <18> 3.2216, <19> 5.4957, <20> 4.037;
param capacity[MACHINE] := <1> 10.7896, <2> 10.7896, <3> 10.7896, <4> 10.7896, <5> 10.7896, <6> 10.7896, <7> 10.7896;

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
