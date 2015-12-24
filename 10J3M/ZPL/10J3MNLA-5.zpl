set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.2698, <2> 34.3318, <3> 28.4964, <4> 19.7915, <5> 29.2699, <6> 30.0076, <7> 13.679, <8> 34.6511, <9> 29.6465, <10> 20.8853;
param workload[JOB] := <1> 410.8648, <2> 1178.6725, <3> 812.0448, <4> 391.7035, <5> 856.727, <6> 900.4561, <7> 187.115, <8> 1200.6987, <9> 878.915, <10> 436.1958;
param capacity[MACHINE] := <1> 2417.7977, <2> 2417.7977, <3> 2417.7977;

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
