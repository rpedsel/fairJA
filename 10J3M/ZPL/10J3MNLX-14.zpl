set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.7484, <2> 26.7626, <3> 27.7448, <4> 28.5723, <5> 19.0766, <6> 27.4801, <7> 25.3872, <8> 25.3919, <9> 14.8903, <10> 24.287;
param workload[JOB] := <1> 4.3299, <2> 5.1733, <3> 5.2673, <4> 5.3453, <5> 4.3677, <6> 5.2421, <7> 5.0386, <8> 5.039, <9> 3.8588, <10> 4.9282;
param capacity[MACHINE] := <1> 16.1967, <2> 16.1967, <3> 16.1967;

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
