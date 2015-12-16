set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.9219, <2> 30.1375, <3> 41.2037, <4> 32.758, <5> 28.4857, <6> 32.9865, <7> 18.0406, <8> 16.6407, <9> 36.3883, <10> 29.0784, <11> 31.4432, <12> 24.1925, <13> 30.0644, <14> 24.7099, <15> 22.2018, <16> 34.7711, <17> 16.4402, <18> 31.0437, <19> 21.2884, <20> 22.5695;
param workload[JOB] := <1> 4.6821, <2> 5.4898, <3> 6.419, <4> 5.7235, <5> 5.3372, <6> 5.7434, <7> 4.2474, <8> 4.0793, <9> 6.0323, <10> 5.3924, <11> 5.6074, <12> 4.9186, <13> 5.4831, <14> 4.9709, <15> 4.7119, <16> 5.8967, <17> 4.0547, <18> 5.5717, <19> 4.6139, <20> 4.7507;
param capacity[MACHINE] := <1> 17.2877, <2> 17.2877, <3> 17.2877, <4> 17.2877, <5> 17.2877, <6> 17.2877;

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
