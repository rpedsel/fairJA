set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.9775, <2> 24.2418, <3> 21.4756, <4> 25.3931, <5> 21.5076, <6> 28.6203, <7> 21.991, <8> 24.5707, <9> 24.2167, <10> 23.5226, <11> 19.6541, <12> 25.9048, <13> 27.5721, <14> 28.6596, <15> 22.7823, <16> 28.6861, <17> 24.597, <18> 29.7869, <19> 26.2086, <20> 25.9258;
param workload[JOB] := <1> 5.194, <2> 4.9236, <3> 4.6342, <4> 5.0392, <5> 4.6376, <6> 5.3498, <7> 4.6895, <8> 4.9569, <9> 4.921, <10> 4.85, <11> 4.4333, <12> 5.0897, <13> 5.2509, <14> 5.3535, <15> 4.7731, <16> 5.3559, <17> 4.9595, <18> 5.4577, <19> 5.1194, <20> 5.0917;
param capacity[MACHINE] := <1> 14.2972, <2> 14.2972, <3> 14.2972, <4> 14.2972, <5> 14.2972, <6> 14.2972, <7> 14.2972;

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
