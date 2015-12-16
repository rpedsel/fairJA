set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 29.2772, <2> 22.9715, <3> 31.4124, <4> 24.1923, <5> 23.9176, <6> 13.7936, <7> 26.3559, <8> 24.2332, <9> 19.5395, <10> 25.0616, <11> 26.1685, <12> 23.4815, <13> 25.1126, <14> 24.6967, <15> 19.5488, <16> 18.3888, <17> 30.0994, <18> 25.9849, <19> 21.272, <20> 20.8016;
param workload[JOB] := <1> 5.4108, <2> 4.7929, <3> 5.6047, <4> 4.9186, <5> 4.8906, <6> 3.714, <7> 5.1338, <8> 4.9227, <9> 4.4204, <10> 5.0062, <11> 5.1155, <12> 4.8458, <13> 5.0112, <14> 4.9696, <15> 4.4214, <16> 4.2882, <17> 5.4863, <18> 5.0975, <19> 4.6122, <20> 4.5609;
param capacity[MACHINE] := <1> 12.1529, <2> 12.1529, <3> 12.1529, <4> 12.1529, <5> 12.1529, <6> 12.1529;

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
