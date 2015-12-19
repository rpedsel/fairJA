set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 35.8546, <2> 36.2198, <3> 44.6328, <4> 36.5054, <5> 48.3267, <6> 11.8083, <7> 37.0976, <8> 48.2218, <9> 26.8714, <10> 24.2007;
param workload[JOB] := <1> 5.9879, <2> 6.0183, <3> 6.6808, <4> 6.042, <5> 6.9517, <6> 3.4363, <7> 6.0908, <8> 6.9442, <9> 5.1838, <10> 4.9194;
param capacity[MACHINE] := <1> 19.4184, <2> 19.4184, <3> 19.4184;

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
