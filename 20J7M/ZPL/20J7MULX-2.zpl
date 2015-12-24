set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 9.7947, <2> 44.6609, <3> 41.933, <4> 31.3045, <5> 38.0044, <6> 10.8294, <7> 2.0174, <8> 10.2074, <9> 39.2421, <10> 0.5793, <11> 35.2177, <12> 15.5592, <13> 9.0215, <14> 12.6082, <15> 10.7002, <16> 4.0762, <17> 4.39, <18> 28.3182, <19> 24.8676, <20> 47.9293;
param workload[JOB] := <1> 3.1296, <2> 6.6829, <3> 6.4756, <4> 5.595, <5> 6.1648, <6> 3.2908, <7> 1.4204, <8> 3.1949, <9> 6.2644, <10> 0.7611, <11> 5.9345, <12> 3.9445, <13> 3.0036, <14> 3.5508, <15> 3.2711, <16> 2.019, <17> 2.0952, <18> 5.3215, <19> 4.9867, <20> 6.9231;
param capacity[MACHINE] := <1> 12.0042, <2> 12.0042, <3> 12.0042, <4> 12.0042, <5> 12.0042, <6> 12.0042, <7> 12.0042;

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
