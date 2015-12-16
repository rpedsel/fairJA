set JOB := {1 .. 20};
set MACHINE := {1 .. 6};
set JM := JOB * MACHINE;

param benefit[JOB] := <1> 16.643, <2> 4.6347, <3> 49.2684, <4> 3.6929, <5> 41.1215, <6> 48.9151, <7> 28.6028, <8> 24.1871, <9> 6.3495, <10> 9.0956, <11> 1.7023, <12> 29.2192, <13> 33.0387, <14> 30.8971, <15> 18.8431, <16> 12.5908, <17> 3.2988, <18> 13.9316, <19> 3.4314, <20> 7.7197;
param workload[JOB] := <1> 4.0796, <2> 2.1528, <3> 7.0191, <4> 1.9217, <5> 6.4126, <6> 6.9939, <7> 5.3482, <8> 4.918, <9> 2.5198, <10> 3.0159, <11> 1.3047, <12> 5.4055, <13> 5.7479, <14> 5.5585, <15> 4.3409, <16> 3.5484, <17> 1.8163, <18> 3.7325, <19> 1.8524, <20> 2.7784;
param capacity[MACHINE] := <1> 13.4112, <2> 13.4112, <3> 13.4112, <4> 13.4112, <5> 13.4112, <6> 13.4112;

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
