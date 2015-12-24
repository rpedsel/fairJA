set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.6446, <2> 20.5135, <3> 33.3872, <4> 28.4994, <5> 29.4962, <6> 25.0193, <7> 23.5733, <8> 25.1195, <9> 39.005, <10> 30.7538;
param workload[JOB] := <1> 43.644, <2> 9.0399, <3> 1.0158, <4> 10.7318, <5> 17.1464, <6> 25.0832, <7> 17.521, <8> 22.4914, <9> 14.3537, <10> 26.756;
param capacity[MACHINE] := <1> 187.7832, <2> 187.7832, <3> 187.7832;

var x[JM] binary;
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
