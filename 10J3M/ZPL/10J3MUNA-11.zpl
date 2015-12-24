set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 46.5786, <2> 23.4143, <3> 23.7763, <4> 28.8986, <5> 15.9069, <6> 28.6216, <7> 45.8884, <8> 40.7854, <9> 35.9136, <10> 10.5958;
param workload[JOB] := <1> 2169.566, <2> 548.2294, <3> 565.3124, <4> 835.1291, <5> 253.0295, <6> 819.196, <7> 2105.7453, <8> 1663.4489, <9> 1289.7867, <10> 112.271;
param capacity[MACHINE] := <1> 10361.7143, <2> 10361.7143, <3> 10361.7143;

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
