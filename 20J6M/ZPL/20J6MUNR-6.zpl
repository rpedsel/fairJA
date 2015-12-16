set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 49.9807, <2> 44.2812, <3> 8.6993, <4> 47.5492, <5> 42.7186, <6> 37.8514, <7> 36.672, <8> 44.4343, <9> 13.0282, <10> 36.6822, <11> 20.3003, <12> 17.2809, <13> 2.8797, <14> 21.7461, <15> 30.1989, <16> 23.8847, <17> 1.9498, <18> 38.2852, <19> 40.6295, <20> 38.3481;
param workload[JOB] := <1> 37.6387, <2> 35.154, <3> 15.4908, <4> 5.8538, <5> 21.3528, <6> 14.8658, <7> 6.6296, <8> 30.0188, <9> 2.501, <10> 18.5242, <11> 11.8713, <12> 2.9522, <13> 19.2614, <14> 23.6247, <15> 6.4372, <16> 40.2574, <17> 26.4939, <18> 12.7638, <19> 43.9146, <20> 2.9359;
param capacity[MACHINE] := <1> 378.5419, <2> 378.5419, <3> 378.5419, <4> 378.5419, <5> 378.5419, <6> 378.5419;

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
