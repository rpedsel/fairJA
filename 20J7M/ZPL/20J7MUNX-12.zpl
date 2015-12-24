set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 19.7669, <2> 38.5514, <3> 15.1789, <4> 47.8431, <5> 20.618, <6> 22.1048, <7> 21.0601, <8> 12.4722, <9> 6.4966, <10> 7.5879, <11> 39.2121, <12> 47.5884, <13> 4.0166, <14> 48.9143, <15> 40.3942, <16> 15.4745, <17> 31.0528, <18> 1.773, <19> 41.6815, <20> 43.4423;
param workload[JOB] := <1> 4.446, <2> 6.209, <3> 3.896, <4> 6.9169, <5> 4.5407, <6> 4.7016, <7> 4.5891, <8> 3.5316, <9> 2.5488, <10> 2.7546, <11> 6.262, <12> 6.8984, <13> 2.0041, <14> 6.9939, <15> 6.3556, <16> 3.9338, <17> 5.5725, <18> 1.3315, <19> 6.4561, <20> 6.5911;
param capacity[MACHINE] := <1> 96.5333, <2> 96.5333, <3> 96.5333, <4> 96.5333, <5> 96.5333, <6> 96.5333, <7> 96.5333;

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
