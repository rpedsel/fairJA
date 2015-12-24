set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 11.3734, <2> 43.3217, <3> 25.5012, <4> 41.6849, <5> 3.3176, <6> 43.4882, <7> 16.6304, <8> 19.239, <9> 45.0333, <10> 49.6773;
param workload[JOB] := <1> 3.3724, <2> 6.5819, <3> 5.0499, <4> 6.4564, <5> 1.8214, <6> 6.5946, <7> 4.078, <8> 4.3862, <9> 6.7107, <10> 7.0482;
param capacity[MACHINE] := <1> 17.3666, <2> 17.3666, <3> 17.3666;

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
