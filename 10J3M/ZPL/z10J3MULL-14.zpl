set JOB := {1 .. 10};
set MACHINE := {1 .. 3};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.2772, <2> 5.7256, <3> 4.221, <4> 15.6296, <5> 25.7181, <6> 22.8486, <7> 37.8614, <8> 1.5151, <9> 7.9807, <10> 0.1333;
param workload[JOB] := <1> 21.2772, <2> 5.7256, <3> 4.221, <4> 15.6296, <5> 25.7181, <6> 22.8486, <7> 37.8614, <8> 1.5151, <9> 7.9807, <10> 0.1333;
param capacity[MACHINE] := <1> 47.6369, <2> 47.6369, <3> 47.6369;

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
