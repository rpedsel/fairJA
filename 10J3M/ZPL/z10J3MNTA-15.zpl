set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 27.4071, <2> 17.0272, <3> 16.161, <4> 32.9532, <5> 22.5392, <6> 20.5288, <7> 36.8065, <8> 24.6845, <9> 27.4931, <10> 23.1872;
param workload[JOB] := <1> 751.1491, <2> 289.9255, <3> 261.1779, <4> 1085.9134, <5> 508.0155, <6> 421.4316, <7> 1354.7184, <8> 609.3245, <9> 755.8705, <10> 537.6462;
param capacity[MACHINE] := <1> 1643.7931, <2> 1643.7931, <3> 1643.7931;

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
