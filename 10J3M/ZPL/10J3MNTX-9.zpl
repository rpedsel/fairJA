set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 24.4974, <2> 30.9444, <3> 33.0595, <4> 26.1146, <5> 28.6197, <6> 25.615, <7> 36.4625, <8> 18.3696, <9> 22.8702, <10> 27.0703;
param workload[JOB] := <1> 4.9495, <2> 5.5628, <3> 5.7497, <4> 5.1102, <5> 5.3497, <6> 5.0611, <7> 6.0384, <8> 4.286, <9> 4.7823, <10> 5.2029;
param capacity[MACHINE] := <1> 13.0232, <2> 13.0232, <3> 13.0232;

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
