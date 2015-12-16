set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.7736, <2> 25.6134, <3> 30.2919, <4> 23.3504, <5> 26.6057, <6> 27.617, <7> 33.8484, <8> 17.7667, <9> 24.9861, <10> 25.1006;
param workload[JOB] := <1> 886.4673, <2> 656.0463, <3> 917.5992, <4> 545.2412, <5> 707.8633, <6> 762.6987, <7> 1145.7142, <8> 315.6556, <9> 624.3052, <10> 630.0401;
param capacity[MACHINE] := <1> 7191.6311, <2> 7191.6311, <3> 7191.6311;

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
