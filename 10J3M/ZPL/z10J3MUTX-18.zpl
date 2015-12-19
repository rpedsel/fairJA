set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 38.357, <2> 25.8725, <3> 6.3408, <4> 0.1098, <5> 18.5243, <6> 36.4114, <7> 40.1697, <8> 39.6103, <9> 21.5471, <10> 29.8809;
param workload[JOB] := <1> 6.1933, <2> 5.0865, <3> 2.5181, <4> 0.3314, <5> 4.304, <6> 6.0342, <7> 6.338, <8> 6.2937, <9> 4.6419, <10> 5.4663;
param capacity[MACHINE] := <1> 11.8018, <2> 11.8018, <3> 11.8018;

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
