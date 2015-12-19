set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.0712, <2> 32.3137, <3> 20.9765, <4> 29.3556, <5> 22.6913, <6> 34.4707, <7> 22.5236, <8> 29.029, <9> 23.0137, <10> 24.6098;
param workload[JOB] := <1> 532.2803, <2> 1044.1752, <3> 440.0136, <4> 861.7513, <5> 514.8951, <6> 1188.2292, <7> 507.3126, <8> 842.6828, <9> 529.6304, <10> 605.6423;
param capacity[MACHINE] := <1> 1766.6532, <2> 1766.6532, <3> 1766.6532;

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
