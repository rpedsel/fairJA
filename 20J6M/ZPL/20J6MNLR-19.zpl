set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 17.2329, <2> 31.8156, <3> 28.6108, <4> 29.4592, <5> 33.7701, <6> 26.2933, <7> 35.3748, <8> 27.0474, <9> 30.2722, <10> 20.4971, <11> 28.7461, <12> 29.5607, <13> 26.552, <14> 21.6773, <15> 27.0523, <16> 21.2919, <17> 25.5203, <18> 26.011, <19> 25.6659, <20> 30.5614;
param workload[JOB] := <1> 20.6574, <2> 39.0595, <3> 23.7298, <4> 32.5699, <5> 46.7301, <6> 3.8708, <7> 10.4565, <8> 17.1525, <9> 14.6461, <10> 19.869, <11> 39.0675, <12> 46.1244, <13> 29.6169, <14> 12.3876, <15> 44.1017, <16> 2.6605, <17> 41.7414, <18> 21.8893, <19> 27.9271, <20> 34.1234;
param capacity[MACHINE] := <1> 88.0636, <2> 88.0636, <3> 88.0636, <4> 88.0636, <5> 88.0636, <6> 88.0636;

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
