set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.5373, <2> 24.14, <3> 28.2803, <4> 21.6806, <5> 25.4755, <6> 30.2046, <7> 30.0348, <8> 24.2611, <9> 20.837, <10> 20.8326;
param workload[JOB] := <1> 381.7061, <2> 582.7396, <3> 799.7754, <4> 470.0484, <5> 649.0011, <6> 912.3179, <7> 902.0892, <8> 588.601, <9> 434.1806, <10> 433.9972;
param capacity[MACHINE] := <1> 2051.4855, <2> 2051.4855, <3> 2051.4855;

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
