set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.4481, <2> 19.3072, <3> 23.8672, <4> 30.4284, <5> 29.0416, <6> 24.9715, <7> 23.9357, <8> 19.8644, <9> 20.5011, <10> 22.1394;
param workload[JOB] := <1> 25.9784, <2> 10.7984, <3> 38.8336, <4> 45.2414, <5> 9.6277, <6> 28.6478, <7> 18.1896, <8> 3.0679, <9> 2.2118, <10> 43.1371;
param capacity[MACHINE] := <1> 225.7337, <2> 225.7337, <3> 225.7337;

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
