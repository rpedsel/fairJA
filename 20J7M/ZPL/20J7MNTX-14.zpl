set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 20.6647, <2> 27.3242, <3> 14.3707, <4> 29.297, <5> 26.2462, <6> 25.0619, <7> 20.6309, <8> 26.759, <9> 25.9555, <10> 19.3051, <11> 20.4363, <12> 24.0576, <13> 30.0736, <14> 27.2347, <15> 29.0093, <16> 29.1968, <17> 25.1415, <18> 28.5338, <19> 25.2606, <20> 20.1833;
param workload[JOB] := <1> 4.5458, <2> 5.2273, <3> 3.7909, <4> 5.4127, <5> 5.1231, <6> 5.0062, <7> 4.5421, <8> 5.1729, <9> 5.0947, <10> 4.3938, <11> 4.5207, <12> 4.9049, <13> 5.4839, <14> 5.2187, <15> 5.386, <16> 5.4034, <17> 5.0141, <18> 5.3417, <19> 5.026, <20> 4.4926;
param capacity[MACHINE] := <1> 10.6181, <2> 10.6181, <3> 10.6181, <4> 10.6181, <5> 10.6181, <6> 10.6181, <7> 10.6181;

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
