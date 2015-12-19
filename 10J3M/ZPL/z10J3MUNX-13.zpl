set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.8157, <2> 19.905, <3> 11.8011, <4> 29.9673, <5> 3.4238, <6> 36.6362, <7> 1.5979, <8> 29.9462, <9> 22.5353, <10> 22.9292;
param workload[JOB] := <1> 3.133, <2> 4.4615, <3> 3.4353, <4> 5.4742, <5> 1.8504, <6> 6.0528, <7> 1.2641, <8> 5.4723, <9> 4.7471, <10> 4.7884;
param capacity[MACHINE] := <1> 40.6791, <2> 40.6791, <3> 40.6791;

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
