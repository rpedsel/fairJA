set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 32.7825, <2> 34.0775, <3> 0.7267, <4> 16.5168, <5> 37.3125, <6> 3.9402, <7> 5.1831, <8> 1.0751, <9> 5.8905, <10> 1.088, <11> 14.9061, <12> 29.8774, <13> 27.1949, <14> 12.0262, <15> 13.8294, <16> 46.2822, <17> 12.4598, <18> 5.6895, <19> 45.1527, <20> 40.4091;
param workload[JOB] := <1> 5.7256, <2> 5.8376, <3> 0.8525, <4> 4.0641, <5> 6.1084, <6> 1.985, <7> 2.2766, <8> 1.0369, <9> 2.427, <10> 1.0431, <11> 3.8608, <12> 5.466, <13> 5.2149, <14> 3.4679, <15> 3.7188, <16> 6.8031, <17> 3.5298, <18> 2.3853, <19> 6.7196, <20> 6.3568;
param capacity[MACHINE] := <1> 11.2685, <2> 11.2685, <3> 11.2685, <4> 11.2685, <5> 11.2685, <6> 11.2685, <7> 11.2685;

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
