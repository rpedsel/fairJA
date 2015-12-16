set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.352, <2> 17.9377, <3> 32.3545, <4> 26.1144, <5> 29.9189, <6> 19.9129, <7> 23.8263, <8> 20.5597, <9> 22.9332, <10> 20.6058, <11> 26.354, <12> 28.1739, <13> 20.6559, <14> 27.3725, <15> 30.319, <16> 28.0385, <17> 28.37, <18> 22.6145, <19> 16.6704, <20> 34.5633;
param workload[JOB] := <1> 25.352, <2> 17.9377, <3> 32.3545, <4> 26.1144, <5> 29.9189, <6> 19.9129, <7> 23.8263, <8> 20.5597, <9> 22.9332, <10> 20.6058, <11> 26.354, <12> 28.1739, <13> 20.6559, <14> 27.3725, <15> 30.319, <16> 28.0385, <17> 28.37, <18> 22.6145, <19> 16.6704, <20> 34.5633;
param capacity[MACHINE] := <1> 62.831, <2> 62.831, <3> 62.831, <4> 62.831, <5> 62.831, <6> 62.831;

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
