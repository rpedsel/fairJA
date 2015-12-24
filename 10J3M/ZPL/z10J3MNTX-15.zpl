set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.0023, <2> 26.1549, <3> 17.0317, <4> 20.6337, <5> 25.003, <6> 20.8827, <7> 19.2057, <8> 20.6654, <9> 15.7906, <10> 25.4985;
param workload[JOB] := <1> 5.0002, <2> 5.1142, <3> 4.1269, <4> 4.5424, <5> 5.0003, <6> 4.5698, <7> 4.3824, <8> 4.5459, <9> 3.9737, <10> 5.0496;
param capacity[MACHINE] := <1> 11.5763, <2> 11.5763, <3> 11.5763;

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
