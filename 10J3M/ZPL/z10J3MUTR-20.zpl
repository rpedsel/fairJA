set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.7386, <2> 34.8649, <3> 36.149, <4> 32.6932, <5> 47.2271, <6> 48.4784, <7> 24.7016, <8> 34.5953, <9> 46.5796, <10> 35.0714;
param workload[JOB] := <1> 6.4923, <2> 32.3638, <3> 36.3577, <4> 35.7629, <5> 20.3958, <6> 4.8462, <7> 15.0083, <8> 24.53, <9> 49.6264, <10> 35.7304;
param capacity[MACHINE] := <1> 65.2784, <2> 65.2784, <3> 65.2784;

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
