set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 25.0498, <2> 43.6112, <3> 17.9784, <4> 34.1377, <5> 38.2907, <6> 23.2194, <7> 35.164, <8> 43.1135, <9> 35.0859, <10> 4.5913, <11> 0.1489, <12> 0.6245, <13> 4.6137, <14> 10.8052, <15> 41.7574, <16> 43.8439, <17> 34.6933, <18> 27.4248, <19> 48.7908, <20> 40.5611;
param workload[JOB] := <1> 5.005, <2> 6.6039, <3> 4.2401, <4> 5.8427, <5> 6.1879, <6> 4.8187, <7> 5.9299, <8> 6.5661, <9> 5.9233, <10> 2.1427, <11> 0.3859, <12> 0.7903, <13> 2.148, <14> 3.2871, <15> 6.462, <16> 6.6215, <17> 5.8901, <18> 5.2369, <19> 6.985, <20> 6.3688;
param capacity[MACHINE] := <1> 10.4396, <2> 10.4396, <3> 10.4396, <4> 10.4396, <5> 10.4396, <6> 10.4396, <7> 10.4396;

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
