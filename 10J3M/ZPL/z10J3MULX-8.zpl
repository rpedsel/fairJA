set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 23.0898, <2> 48.7097, <3> 11.2004, <4> 40.7392, <5> 34.8313, <6> 42.732, <7> 7.4534, <8> 12.8569, <9> 42.4633, <10> 23.0431;
param workload[JOB] := <1> 4.8052, <2> 6.9792, <3> 3.3467, <4> 6.3827, <5> 5.9018, <6> 6.537, <7> 2.7301, <8> 3.5857, <9> 6.5164, <10> 4.8003;
param capacity[MACHINE] := <1> 17.195, <2> 17.195, <3> 17.195;

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
