set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 40.4169, <2> 4.2016, <3> 15.5613, <4> 24.1911, <5> 42.7638, <6> 7.9966, <7> 17.7275, <8> 1.8464, <9> 47.8035, <10> 14.7072, <11> 43.8337, <12> 12.6463, <13> 42.793, <14> 27.9811, <15> 44.5949, <16> 16.872, <17> 47.5891, <18> 45.5885, <19> 30.1737, <20> 13.1656;
param workload[JOB] := <1> 27.2569, <2> 6.1924, <3> 46.2717, <4> 29.7982, <5> 11.5819, <6> 39.0154, <7> 18.134, <8> 31.4372, <9> 16.452, <10> 30.2568, <11> 26.7875, <12> 27.376, <13> 38.0056, <14> 4.2047, <15> 18.1791, <16> 3.2489, <17> 17.3471, <18> 29.4087, <19> 29.1121, <20> 6.9766;
param capacity[MACHINE] := <1> 76.1738, <2> 76.1738, <3> 76.1738, <4> 76.1738, <5> 76.1738, <6> 76.1738;

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
