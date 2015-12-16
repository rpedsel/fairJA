set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 42.4845, <2> 23.4198, <3> 5.9073, <4> 45.3349, <5> 28.2011, <6> 1.5448, <7> 36.8927, <8> 3.549, <9> 42.5808, <10> 6.7757;
param workload[JOB] := <1> 42.2032, <2> 35.8401, <3> 6.3802, <4> 0.0481, <5> 32.4751, <6> 42.8326, <7> 25.2772, <8> 27.6206, <9> 15.5806, <10> 40.7237;
param capacity[MACHINE] := <1> 67.2454, <2> 67.2454, <3> 67.2454;

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
