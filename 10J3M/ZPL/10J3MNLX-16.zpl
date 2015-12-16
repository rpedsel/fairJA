set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 28.8377, <2> 28.5565, <3> 20.4646, <4> 29.9749, <5> 32.2552, <6> 26.7697, <7> 26.3479, <8> 28.8846, <9> 18.0667, <10> 26.4419;
param workload[JOB] := <1> 5.3701, <2> 5.3438, <3> 4.5238, <4> 5.4749, <5> 5.6794, <6> 5.1739, <7> 5.133, <8> 5.3744, <9> 4.2505, <10> 5.1422;
param capacity[MACHINE] := <1> 17.1553, <2> 17.1553, <3> 17.1553;

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
