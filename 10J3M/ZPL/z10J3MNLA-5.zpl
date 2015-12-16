set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.7102, <2> 24.295, <3> 21.7029, <4> 20.2804, <5> 24.0391, <6> 23.9227, <7> 28.37, <8> 22.3187, <9> 24.3345, <10> 24.2483;
param workload[JOB] := <1> 279.2308, <2> 590.247, <3> 471.0159, <4> 411.2946, <5> 577.8783, <6> 572.2956, <7> 804.8569, <8> 498.1244, <9> 592.1679, <10> 587.9801;
param capacity[MACHINE] := <1> 1795.0305, <2> 1795.0305, <3> 1795.0305;

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
