set JOB := {1 .. 20};
set MACHINE := {1 .. 7};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 26.407, <2> 23.6233, <3> 28.9241, <4> 31.3344, <5> 22.9906, <6> 22.1278, <7> 25.8689, <8> 29.0744, <9> 24.6312, <10> 19.6362, <11> 11.6673, <12> 23.4164, <13> 15.4216, <14> 27.2709, <15> 18.0537, <16> 19.4579, <17> 31.6968, <18> 24.6241, <19> 29.4614, <20> 30.2705;
param workload[JOB] := <1> 697.3296, <2> 558.0603, <3> 836.6036, <4> 981.8446, <5> 528.5677, <6> 489.6395, <7> 669.2, <8> 845.3207, <9> 606.696, <10> 385.5804, <11> 136.1259, <12> 548.3278, <13> 237.8257, <14> 743.702, <15> 325.9361, <16> 378.6099, <17> 1004.6871, <18> 606.3463, <19> 867.9741, <20> 916.3032;
param capacity[MACHINE] := <1> 1324.7872, <2> 1324.7872, <3> 1324.7872, <4> 1324.7872, <5> 1324.7872, <6> 1324.7872, <7> 1324.7872;

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
