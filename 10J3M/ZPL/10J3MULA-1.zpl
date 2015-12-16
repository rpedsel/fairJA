set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.8532, <2> 7.8775, <3> 7.8853, <4> 0.3926, <5> 27.9628, <6> 37.8244, <7> 26.0813, <8> 41.307, <9> 8.4995, <10> 20.5044;
param workload[JOB] := <1> 775.8008, <2> 62.055, <3> 62.178, <4> 0.1541, <5> 781.9182, <6> 1430.6852, <7> 680.2342, <8> 1706.2682, <9> 72.2415, <10> 420.4304;
param capacity[MACHINE] := <1> 1997.3219, <2> 1997.3219, <3> 1997.3219;

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
