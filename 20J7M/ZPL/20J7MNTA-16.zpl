set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 21.561, <2> 35.9467, <3> 10.9074, <4> 27.8954, <5> 15.7194, <6> 24.7981, <7> 19.3482, <8> 23.4335, <9> 33.524, <10> 22.8958, <11> 28.5458, <12> 22.6554, <13> 29.3696, <14> 27.6781, <15> 16.8329, <16> 27.1866, <17> 16.4738, <18> 26.9428, <19> 25.0469, <20> 24.3137;
param workload[JOB] := <1> 464.8767, <2> 1292.1652, <3> 118.9714, <4> 778.1533, <5> 247.0995, <6> 614.9458, <7> 374.3528, <8> 549.1289, <9> 1123.8586, <10> 524.2177, <11> 814.8627, <12> 513.2671, <13> 862.5734, <14> 766.0772, <15> 283.3465, <16> 739.1112, <17> 271.3861, <18> 725.9145, <19> 627.3472, <20> 591.156;
param capacity[MACHINE] := <1> 1316.0156, <2> 1316.0156, <3> 1316.0156, <4> 1316.0156, <5> 1316.0156, <6> 1316.0156, <7> 1316.0156;

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
