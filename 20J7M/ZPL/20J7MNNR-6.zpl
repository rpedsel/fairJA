set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.0916, <2> 19.3292, <3> 24.9439, <4> 30.4394, <5> 31.8188, <6> 23.546, <7> 27.2858, <8> 23.0854, <9> 31.683, <10> 26.9399, <11> 27.6911, <12> 32.2421, <13> 24.8196, <14> 22.8165, <15> 25.9509, <16> 27.7451, <17> 24.962, <18> 22.1153, <19> 32.8939, <20> 28.2083;
param workload[JOB] := <1> 16.0665, <2> 25.6087, <3> 29.353, <4> 11.8186, <5> 22.1655, <6> 14.1246, <7> 39.4476, <8> 25.6518, <9> 24.9564, <10> 43.0907, <11> 41.7679, <12> 4.4376, <13> 15.8921, <14> 0.7181, <15> 44.6565, <16> 15.856, <17> 47.5652, <18> 45.8191, <19> 19.1349, <20> 17.8329;
param capacity[MACHINE] := <1> 505.9637, <2> 505.9637, <3> 505.9637, <4> 505.9637, <5> 505.9637, <6> 505.9637, <7> 505.9637;

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
