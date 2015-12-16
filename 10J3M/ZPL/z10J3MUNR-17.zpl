set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 2.1474, <2> 3.7549, <3> 26.8223, <4> 26.4212, <5> 33.4332, <6> 49.3705, <7> 3.5459, <8> 42.1968, <9> 27.5245, <10> 42.6683;
param workload[JOB] := <1> 13.4075, <2> 16.3367, <3> 33.372, <4> 48.0409, <5> 15.33, <6> 24.0739, <7> 23.7146, <8> 35.2637, <9> 17.6927, <10> 47.6324;
param capacity[MACHINE] := <1> 274.8644, <2> 274.8644, <3> 274.8644;

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
