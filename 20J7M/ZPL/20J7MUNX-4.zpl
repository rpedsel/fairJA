set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 33.828, <2> 45.4852, <3> 1.0519, <4> 24.0199, <5> 5.627, <6> 29.1078, <7> 49.0699, <8> 48.2981, <9> 44.6953, <10> 40.0825, <11> 22.0541, <12> 39.4208, <13> 46.6205, <14> 27.8524, <15> 29.7439, <16> 1.602, <17> 41.0023, <18> 29.8993, <19> 24.6603, <20> 47.596;
param workload[JOB] := <1> 5.8162, <2> 6.7443, <3> 1.0256, <4> 4.901, <5> 2.3721, <6> 5.3952, <7> 7.005, <8> 6.9497, <9> 6.6855, <10> 6.3311, <11> 4.6962, <12> 6.2786, <13> 6.8279, <14> 5.2775, <15> 5.4538, <16> 1.2657, <17> 6.4033, <18> 5.468, <19> 4.9659, <20> 6.899;
param capacity[MACHINE] := <1> 106.7616, <2> 106.7616, <3> 106.7616, <4> 106.7616, <5> 106.7616, <6> 106.7616, <7> 106.7616;

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
