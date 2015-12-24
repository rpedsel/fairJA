set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 2.6301, <2> 44.1359, <3> 20.9125, <4> 4.9057, <5> 32.5523, <6> 32.3518, <7> 38.3275, <8> 31.6132, <9> 11.6914, <10> 35.8339, <11> 6.1055, <12> 11.1436, <13> 47.298, <14> 29.1747, <15> 49.3963, <16> 3.7519, <17> 5.5431, <18> 12.4744, <19> 12.9306, <20> 34.0661;
param workload[JOB] := <1> 1.6218, <2> 6.6435, <3> 4.573, <4> 2.2149, <5> 5.7055, <6> 5.6879, <7> 6.1909, <8> 5.6226, <9> 3.4193, <10> 5.9861, <11> 2.4709, <12> 3.3382, <13> 6.8774, <14> 5.4014, <15> 7.0283, <16> 1.937, <17> 2.3544, <18> 3.5319, <19> 3.5959, <20> 5.8366;
param capacity[MACHINE] := <1> 9.6469, <2> 9.6469, <3> 9.6469, <4> 9.6469, <5> 9.6469, <6> 9.6469, <7> 9.6469;

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
