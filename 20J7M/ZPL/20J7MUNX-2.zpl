set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 2.6471, <2> 41.6531, <3> 3.0959, <4> 48.4774, <5> 2.3645, <6> 6.3982, <7> 18.7293, <8> 19.1916, <9> 22.8883, <10> 0.3011, <11> 16.5166, <12> 26.753, <13> 48.5276, <14> 49.7891, <15> 5.1993, <16> 37.8398, <17> 2.1162, <18> 45.0812, <19> 4.5665, <20> 43.288;
param workload[JOB] := <1> 1.627, <2> 6.4539, <3> 1.7595, <4> 6.9626, <5> 1.5377, <6> 2.5295, <7> 4.3277, <8> 4.3808, <9> 4.7842, <10> 0.5487, <11> 4.0641, <12> 5.1723, <13> 6.9662, <14> 7.0561, <15> 2.2802, <16> 6.1514, <17> 1.4547, <18> 6.7143, <19> 2.1369, <20> 6.5794;
param capacity[MACHINE] := <1> 83.4872, <2> 83.4872, <3> 83.4872, <4> 83.4872, <5> 83.4872, <6> 83.4872, <7> 83.4872;

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
