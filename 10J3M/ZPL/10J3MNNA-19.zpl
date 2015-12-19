set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.2152, <2> 22.7445, <3> 20.9967, <4> 16.285, <5> 30.8255, <6> 32.4919, <7> 26.2963, <8> 30.9786, <9> 25.8325, <10> 14.0607;
param workload[JOB] := <1> 408.6543, <2> 517.3123, <3> 440.8614, <4> 265.2012, <5> 950.2115, <6> 1055.7236, <7> 691.4954, <8> 959.6737, <9> 667.3181, <10> 197.7033;
param capacity[MACHINE] := <1> 6154.1548, <2> 6154.1548, <3> 6154.1548;

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
