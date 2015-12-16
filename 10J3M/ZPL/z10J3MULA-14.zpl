set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 30.1563, <2> 25.437, <3> 36.605, <4> 29.1252, <5> 37.5874, <6> 30.4584, <7> 5.0963, <8> 15.325, <9> 34.8086, <10> 49.4411;
param workload[JOB] := <1> 909.4024, <2> 647.041, <3> 1339.926, <4> 848.2773, <5> 1412.8126, <6> 927.7141, <7> 25.9723, <8> 234.8556, <9> 1211.6386, <10> 2444.4224;
param capacity[MACHINE] := <1> 3334.0208, <2> 3334.0208, <3> 3334.0208;

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
