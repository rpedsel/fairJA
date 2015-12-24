set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 18.5553, <2> 24.9162, <3> 25.2077, <4> 42.3692, <5> 23.0358, <6> 10.3253, <7> 9.2865, <8> 42.692, <9> 21.8, <10> 15.7419, <11> 15.0991, <12> 33.377, <13> 19.1942, <14> 35.2883, <15> 8.8633, <16> 9.1006, <17> 1.886, <18> 11.224, <19> 44.2247, <20> 12.2652;
param workload[JOB] := <1> 18.5553, <2> 24.9162, <3> 25.2077, <4> 42.3692, <5> 23.0358, <6> 10.3253, <7> 9.2865, <8> 42.692, <9> 21.8, <10> 15.7419, <11> 15.0991, <12> 33.377, <13> 19.1942, <14> 35.2883, <15> 8.8633, <16> 9.1006, <17> 1.886, <18> 11.224, <19> 44.2247, <20> 12.2652;
param capacity[MACHINE] := <1> 60.636, <2> 60.636, <3> 60.636, <4> 60.636, <5> 60.636, <6> 60.636, <7> 60.636;

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
