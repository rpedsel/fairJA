set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 43.7287, <2> 18.3584, <3> 24.2565, <4> 31.3182, <5> 34.2047, <6> 48.3047, <7> 32.5995, <8> 15.498, <9> 40.714, <10> 27.5977;
param workload[JOB] := <1> 6.6128, <2> 4.2847, <3> 4.9251, <4> 5.5963, <5> 5.8485, <6> 6.9502, <7> 5.7096, <8> 3.9367, <9> 6.3808, <10> 5.2534;
param capacity[MACHINE] := <1> 18.4994, <2> 18.4994, <3> 18.4994;

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
