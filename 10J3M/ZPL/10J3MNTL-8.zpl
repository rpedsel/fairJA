set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.0247, <2> 36.3871, <3> 34.9666, <4> 23.0689, <5> 27.9851, <6> 22.0403, <7> 27.5218, <8> 25.5407, <9> 21.0399, <10> 28.9254;
param workload[JOB] := <1> 19.0247, <2> 36.3871, <3> 34.9666, <4> 23.0689, <5> 27.9851, <6> 22.0403, <7> 27.5218, <8> 25.5407, <9> 21.0399, <10> 28.9254;
param capacity[MACHINE] := <1> 66.6251, <2> 66.6251, <3> 66.6251;

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
