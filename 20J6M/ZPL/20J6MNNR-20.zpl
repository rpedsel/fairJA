set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.4693, <2> 19.9551, <3> 14.4214, <4> 21.7219, <5> 30.7505, <6> 23.4676, <7> 31.8755, <8> 18.6558, <9> 28.9929, <10> 23.7721, <11> 22.2648, <12> 31.8651, <13> 26.5697, <14> 18.7506, <15> 28.8238, <16> 27.8553, <17> 29.0106, <18> 23.1752, <19> 30.0105, <20> 26.3152;
param workload[JOB] := <1> 19.2335, <2> 41.02, <3> 3.5825, <4> 31.9845, <5> 7.5665, <6> 26.4191, <7> 31.3102, <8> 4.7689, <9> 4.6605, <10> 43.7484, <11> 32.8852, <12> 9.7688, <13> 38.0475, <14> 26.9297, <15> 42.789, <16> 41.9347, <17> 7.8427, <18> 0.9378, <19> 22.5411, <20> 3.7581;
param capacity[MACHINE] := <1> 441.7287, <2> 441.7287, <3> 441.7287, <4> 441.7287, <5> 441.7287, <6> 441.7287;

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
