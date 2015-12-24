set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.4269, <2> 24.4769, <3> 21.9525, <4> 32.415, <5> 20.3251, <6> 21.8197, <7> 32.6697, <8> 28.6969, <9> 18.2769, <10> 25.438;
param workload[JOB] := <1> 23.4269, <2> 24.4769, <3> 21.9525, <4> 32.415, <5> 20.3251, <6> 21.8197, <7> 32.6697, <8> 28.6969, <9> 18.2769, <10> 25.438;
param capacity[MACHINE] := <1> 249.4976, <2> 249.4976, <3> 249.4976;

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
